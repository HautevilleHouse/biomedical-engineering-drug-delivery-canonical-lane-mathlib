import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringDrugDeliveryCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure PharmacokineticEquation where
  model : CompartmentModel
  absorptionOrder : Nat
  eliminationHalfLife : Float
  bioavailability : Float
  equationSolved : Prop

structure PharmacokineticBridge (P : PharmacokineticEquation) where
  absorptionOrderPositive : P.absorptionOrder > 0
  eliminationHalfLifePositive : P.eliminationHalfLife > 0
  bioavailabilityBetween0And1 : 0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1
  equationSolvedClosed : P.equationSolved

def PharmacokineticBridgeClosed (P : PharmacokineticEquation) : Prop :=
  P.absorptionOrder > 0 ∧
  P.eliminationHalfLife > 0 ∧
  0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1 ∧
  P.equationSolved

theorem pharmacokinetic_bridge_closed_from_evidence (P : PharmacokineticEquation)
    (B : PharmacokineticBridge P) : PharmacokineticBridgeClosed P := by
  exact And.intro B.absorptionOrderPositive
    (And.intro B.eliminationHalfLifePositive
      (And.intro B.bioavailabilityBetween0And1.1
        (And.intro B.bioavailabilityBetween0And1.2 B.equationSolvedClosed)))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse